# Hello World Program in Bash Shell

submodules=(
    "backend"
    "frontend"
);

repos=(
    "johnshift/multirepo-backend"
    "johnshift/multirepo-frontend"
);

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
    git submodule add https://github.com/${repos[$i]} ${submodules[$i]}
done

# echo after init
git submodule status