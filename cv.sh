#!/bin/bash


#...................................... Program açılırken ................................
zenity --info --text='<span font="30" foreground="white"><i>Welcome to CV Maker</i></span>' \
	 --width=600 --height=100

rc=$?
case $rc in
    0)
	 (
  		echo 10
  		echo "# CV Maker is loading.."
  		sleep 5

  		echo 15
  		echo "# CV Maker is loading.."
  		sleep 5

 	 	echo 70
  		echo "# CV Maker is laoding"
  		sleep 5

  		echo 100
  		echo "# Completed!.."
	) | zenity --title "Package Installation Progress Bar" --progress --auto-close

#.........................................................................................


FORM=$(zenity --forms --title="Kisisel Bilgi Formu" --text="Lutfen asagıdaki bilgileri eksiksiz ve dogru olarak doldurunuz!"\
	 --separator="," --add-entry="İsim ve Soyisim :"\
	--separator="," --add-entry="Yas:" --add-calendar="Dogum gunu" > addr.csv)

Ilgi_Alani=$(zenity --forms --title="Ilgi Alanlari" --text="Lutfen ilgi alanlarinizi yaziniz" \
		--separator="," --add-entry="1)" --add-entry="2)" --add-entry="3)"  >> addr.csv)

Okullar=$(zenity --forms --title="Okudugu Okullar" --text="Lutfen okudugunuz okullari yaziniz" \
                --separator="," --add-entry="1)Ortaokul: " --add-entry="2)Lise: " --add-entry="3)Universite: "  >> addr.csv)


bilgi=$(zenity --entry "Lutfen kendinizi tanıtmak için özgeçmiş paragrafınızı yazınız " \
                --width 500 \
                --height 150 >> addr.csv);



accepted1=$?
if ((accepted1 != 0)); then
    echo "Yanlıs bir islem yaptiniz!"
    exit 1
fi
bilgilendirme=$(zenity --info --text="Lutfen istediginiz html sablonunu seciniz" --width 200 --height 100)
FILE=$(zenity --file-selection --title="Select a html file" --file-filter="*.html")
if [ -z "$FILE" ]
then
	exit 1
fi

if zenity --question --title="HTML viewer" --text="Would you like to open thisfile with beowser?"
then
	xdg-open "file://${FILE}"
else
	zenity --text-info --filename="$FILE" --html --title="HTML viewer"
fi


zenity --info --text= 
	;;
	*) "Program sonlandırılıyor.." ;;
esac

