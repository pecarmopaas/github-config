#!/bin/bash
set -e

OPTION="$1"
REPO_NAME="$2"
REPO_DESCRIPTION="$3"
PRIVATE_INPUT="$4"

TF_FILE="resources/repositories/repo_main.tf"


if [[ "$PRIVATE_INPUT" == "true" ]]; then
  VISIBILITY="private"
else
  VISIBILITY="public"
fi


add_repo() {
  echo "Adding repository: $REPO_NAME"
  cat <<EOF >> "$TF_FILE"

module "$REPO_NAME" {
  source = "../../modules/repository"
  repo_config = {
    repo_name        = "$REPO_NAME"
    repo_description = "$REPO_DESCRIPTION"
    repo_visibility  = "$VISIBILITY"
  }
}
EOF
}


update_repo() {
  echo "Updating repository: $REPO_NAME"

  awk -v name="$REPO_NAME" -v desc="$REPO_DESCRIPTION" -v vis="$VISIBILITY" '
  BEGIN { module_found=0; in_module=0 }
  /^module "'"$REPO_NAME"'" \{/ { module_found=1; in_module=1 }
  in_module && /repo_name\s*=/ { $0 = "    repo_name        = \"" name "\"" }
  in_module && /repo_description\s*=/ { $0 = "    repo_description = \"" desc "\"" }
  in_module && /repo_visibility\s*=/ { $0 = "    repo_visibility  = \"" vis "\"" }
  in_module && /}/ { in_module=0 }
  { print }
  END { if (!module_found) { print "Error: Module '"$REPO_NAME"' not found for update." > "/dev/stderr"; exit 1 } }
  ' "$TF_FILE" > temp_tf_file && mv temp_tf_file "$TF_FILE"
}


delete_repo() {
  echo "Deleting repository: $REPO_NAME"
  sed -i '/^module "'"$REPO_NAME"'" {/,/^\}$/d' "$TF_FILE"

  sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$TF_FILE"
}


case "$OPTION" in
  Create)
    if grep -q "^module \"$REPO_NAME\" {" "$TF_FILE"; then
      echo "Error: Module '$REPO_NAME' already exists."
      exit 1
    fi
    add_repo
    ;;
  Update)
    if ! grep -q "^module \"$REPO_NAME\" {" "$TF_FILE"; then
      echo "Error: Module '$REPO_NAME' not found for update."
      exit 1
    fi
    update_repo
    ;;
  Delete)
    if ! grep -q "^module \"$REPO_NAME\" {" "$TF_FILE"; then
      echo "Error: Module '$REPO_NAME' not found for deletion."

      exit 1
    fi
    delete_repo
    ;;
  *)
    echo "Error: Invalid option '$OPTION'. Use 'Create', 'Update', or 'Delete'."
    exit 1
    ;;
esac

echo "Operation '$OPTION' for repository '$REPO_NAME' completed successfully."
