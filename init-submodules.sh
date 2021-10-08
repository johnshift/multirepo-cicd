# manual entry for each submodule needed
submodules=(
    "backend"
    "frontend"
);

# manual entry for each repo needed
# IMPORTANT: each submodule should be mapped 1:1 with repos
# repos=(
#     "johnshift/multirepo-backend"
#     "johnshift/multirepo-frontend"
#     "johnshift/multirepo-e2e"
# );

# echo before init
echo "============ before change ========="
git submodule status
echo "===================================="

# cleanup submodules
for module in ${submodules[@]}; do
    git submodule deinit $module
    git rm -rf $module
    rm -rf .git/modules/$module
done

# add updated submodules
for i in ${!submodules[@]}; do
    # git submodule add https://github.com/${repos[$i]} ${submodules[$i]}
    git submodule add -b $1 https://github.com/johnshift/multirepo-${submodules[$i]} ${submodules[$i]}
done

# e2e has only one branch, so we add it here manual
git submodule add https://github.com/johnshift/multirepo-e2e e2e

# echo after init
echo "============ after change =========="
git submodule status
echo "===================================="
