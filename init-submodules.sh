# manual entry for each submodule needed
submodules=(
    "backend"
    "frontend"
    "e2e"
);

# manual entry for each repo needed
# IMPORTANT: each submodule should be mapped 1:1 with repos
# repos=(
#     "johnshift/multirepo-backend"
#     "johnshift/multirepo-frontend"
#     "johnshift/multirepo-e2e"
# );

# echo before init
git submodule status

# cleanup submodules
for module in ${submodules[@]}; do
    git submodule deinit $module
    git rm -rf $module
    rm -rf .git/modules/$module
done

# add updated submodules
for i in ${!submodules[@]}; do
    # git submodule add https://github.com/${repos[$i]} ${submodules[$i]}
    git submodule add https://github.com/johnshift/multirepo-${submodules[$i]} ${submodules[$i]}
done

# echo after init
git submodule status