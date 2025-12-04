#!/USERID=$(id -u)


USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error:: Please run script with root priveleges"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error:: Installation failed"
    exit 1
else
    echo "Installation successful"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Error:: Installation failed"
    exit 1
else
    echo "Installation successful"
fi

dnf install mongodb-mongosh -y

if [ $? -ne 0 ]; then
    echo "Error:: Installation failed"
    exit 1
else
    echo "Installation successful"
fi