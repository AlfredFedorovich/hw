#!/bin/bash


repo_url="$1"
#Проверяем, передан ли URL репозитория
#
if [ -z "$1" ]; then
  read -p "Enter git repository URL: " repo_url
fi


repo_dir=$(basename "$repo_url" .git)


# Клонируем репозиторий
git clone "$repo_url" "$repo_dir" || exit 1
cd "$repo_dir" || exit 1

git_tag=$(git describe --tags)

# Проверяем, есть ли дефис
if [[ "$git_tag" == *"-"* ]]; then
    
    last_tag=$(git describe --tags --abbrev=0)
    
    
    IFS='.' read -ra version <<< "$last_tag"
    major=${version[0]}
    minor=${version[1]}
    patch=${version[2]}

    new_patch=$((patch + 1))
    new_tag="$major.$minor.$new_patch"


    git tag -a "$new_tag" -m "Version $new_tag"

    # Пушим тег в удаленный репозиторий
    git push origin "$new_tag"

    echo "New tag $new_tag created and pushed."
else
    echo "No changes"
fi

#Удаляем директорию
cd ..
rm -rf "$repo_dir"
