
prefix="https://github.com"
suffix=".git"

echo "Input the number of page, please!"
read number_page


echo "Starting"

for project in $(wget -qO- https://github.com/openstack?page=$number_page | grep '<a href="/openstack' | cut -d '"' -f2)
do
    repo="${prefix}${project}${suffix}"
    echo Started clone $repo
    if [[ $repo == *"pagination"* ]]; then
        echo "Page $number_page"
    else
        git clone $repo
    fi
done
