#!/bin/sh
# AscDB Tool for Linux.
# Written by ScymeX

# Logo
logo() {
	clear
	echo "_______________________________________________________________________________"
	echo "|       888                                   8888888b.  888888b.              |"
	echo "|      888888        8888888      88888888    888    88  888  ^88b             |"
	echo "|     888  888      888    888   888    888   888    888 888  .88P             |"
	echo "|    888    888       888        888          888    888 8888888K.             |"
	echo "|   888      888        888      888          888    888 888  ^Y88b            |"
	echo "|  88888888888888        888     888          888    888 888    888            |"
	echo "| 888          888  888   888    888    888   888  .d88P 888   d88P            |"
	echo "|888            888   88888       88888888    8888888P^  8888888P^             |"
	echo "|______________________________________________________________________________|"
}

logo

echo -e " Enter the mysql host name(e.g: localhost):"
read host
echo -e " Enter the mysql user:"
read user
echo -e " Enter the mysql password:"
read pass
echo -e " Enter the mysql port:"
read port
echo -e " "
echo -e " Enter the World database:"
read wdb
echo -e " Enter the Character database:"
read chdb
echo -e " Enter the Logon database:"
read ldb

# Menu
until [ $option == x ]
do
	logo
	echo "	a - Import World Database"
	echo "	b - Import Character Database"
	echo "	c - Import Logon Database"
	echo "	d - Import World Structure"
	echo "	e - Import Character Structure"
	echo "	f - Import Logon Structure"
	echo "!Importing the update is not perfect!"
	echo "	g - Update World Database"
	echo "	h - Update Character Database"
	echo "	i - Update Logon Database"
	echo "-------------------------------------------------------------------"
	echo "	x - Exit this tool"
	echo "-------------------------------------------------------------------"
	echo
	read -p " Enter a char:  " option
	if [ ! $option ]; then
		echo
		read -p " Incorrect option. Press enter key to try again..."
		echo
	else
	if [ $option == a ]; then
		logo
		echo " Import World Database..."
		echo
		echo " Please extract AscDB_0.0.5_150.zip!"
		echo " Press any key to continue!"
		read
		echo " Please wait..."
		mysql -h $host --user=$user --port=$port --password=$pass $wdb < Database/AscDB_0.0.5_150.sql
		fi
	fi
	if [ $option == b ]; then
		logo
		echo " Import Character Database..."
		echo
		echo " Press any key to continue!"
		read
		mysql -h $host --user=$user --port=$port --password=$pass $chdb < Database/Characters.SQL
		
	fi
	if [ $option == c ]; then
		logo
		echo " Import Logon Database..."
		echo
		echo " Press any key to continue!"
		read
		mysql -h $host --user=$user --port=$port --password=$pass $ldb < Database/Logon.SQL
	fi
	if [ $option == d ]; then
		logo
		echo " Import World Database Structure..."
		echo
		echo " Press any key to continue!"
		read
		mysql -h $host --user=$user --port=$port --password=$pass $wdb < Structure/Logon.SQL
	fi
	if [ $option == e ]; then
		logo
		echo " Import Character Database Structure..."
		echo
		echo " Press any key to continue!"
		read
		mysql -h $host --user=$user --port=$port --password=$pass $chdb < Structure/Logon.SQL
	fi
	if [ $option == f ]; then
		logo
		echo " Import Logon Database Structure..."
		echo
		echo " Press any key to continue!"
		read
		mysql -h $host --user=$user --port=$port --password=$pass $ldb < Structure/Logon.SQL
	fi
	if [ $option == g ]; then
		logo
		echo " Import World Database updates..."
		echo
		echo " Press any key to continue!"
		read
		mysql -h $host --user=$user --port=$port --password=$pass $wdb < Updates/World_updates/*.SQL
	fi
	if [ $option == h ]; then
		logo
		echo " Import Character Database updates..."
		echo
		echo " Press any key to continue!"
		read
		mysql -h $host --user=$user --port=$port --password=$pass $chdb < Updates/Char_updates/*.SQL	
	fi
	if [ $option == i ]; then
		logo
		echo " Import Logon Database updates..."
		echo
		echo " Press any key to continue!"
		read
		mysql -h $host --user=$user --port=$port --password=$pass $ldb < Updates/Logon_updates/*.SQL
	fi
	if [ $option != x ]; then
		echo
		read -p " Press any key to continue..."
		echo
	fi
	echo " Thanks for using AscDB Tool!"
done
