#!/bin/bash

# Function to check if wget is installed
check_wget_installed() {
    if ! command -v wget &>/dev/null; then
        echo "wget could not be found, please install it first."
        exit 1
    fi
}

download_files() {
    local base_url=$1
    local directory=$2
    local year=$3
    local -n counter=$4
    shift 4
    local files=("$@")

    for file in "${files[@]}"; do
        echo "Attempting to download ${file}"
        local url="${base_url}${file}"
        local filename=$(printf "%03d_%s_%s" "$counter" "${year}" "$file")
        wget "${url}" -O "${directory}/${filename}" || {
            echo "Failed to download ${file} from ${url}"
            continue
        }
        echo "${filename} downloaded successfully."
        ((counter++))
    done
}

# Counter for rulings
counter=1

# Function to download yearly reports
download_files_yearly_reports() {
    local base_url=$1
    local directory=$2
    shift 2
    local files=("$@")

    for file in "${files[@]}"; do
        local url="${base_url}${file}"
        echo "Attempting to download ${url}"
        wget "${url}" -P "${directory}" || {
            echo "Failed to download ${file} from ${url}"
            continue
        }
        echo "${file} downloaded successfully."
    done
}

# Define start and end years as variables
START_YEAR=2005
END_YEAR=2023

# Base URLs
BASE_URL_RULINGS="https://data-onderwijs.vlaanderen.be/documenten/bestanden/"
BASE_URL_YEARLY_REPORTS="https://www.dbrc.be/sites/default/files/2023-07/R.Stvb_._Jaarverslag_"

# Directories
DIRECTORY_RULINGS="rulings"
DIRECTORY_YEARLY_REPORTS="yearly_reports"


# Ensure wget is installed
check_wget_installed

# Array of filenames of rulings from 2005 to 2023
FILES_RULINGS_2023=(
	"Uitspraken2023Website_SB1.pdf"
	"Uitspraken2023Website_SB2.pdf"
	"uitspraken2023_Naric.pdf"
	"Uitspraken2023Website_BeslissingenTeruggaveLeerkredietVerlorenDoorCOVID-19.pdf"
)

FILES_RULINGS_2022=(
	"Uitspraken2022Website_sb1.pdf"
	"Uitspraken2022Website_sb2.pdf"
	"Uitspraken2022Website_sb3.pdf"
	"Uitspraken2022Website_sb4.pdf"
	"Uitspraken2022Website_sb5.pdf"
	"uitspraken2022_Naric.pdf"
	"Uitspraken2022Website__BeslissingenTeruggaveLeerkredietVerlorenDoorCOVID-19.pdf"
)

FILES_RULINGS_2021=(
	"Uitspraken2021_sb_deel1.pdf"
	"Uitspraken2021_sb_deel2.pdf"
	"Uitspraken2021_sb_deel3.pdf"
	"Uitspraken2021_sb_deel4.pdf"
	"Uitspraken2021_sb_deel5.pdf"
	"Uitspraken2021.pdf"
	"Uitspraken2021Website_LeerkredietEnOvermacht.pdf"
	"Uitspraken2021Website_BeslissingenTeruggaveLeerkredietVerlorenDoorCOVID-19.pdf"
)

FILES_RULINGS_2020=(
	"13224.pdf"
	"Uitspraken2020_deel2.pdf"
	"13226.pdf"
	"Uitspraken2020_deel4.pdf"
	"Uitspraken2020_deel5.pdf"
	"Uitspraken2020_deel6.pdf"
	"12969.pdf"
)

FILES_RULINGS_2019=(
	"12400.pdf"
	"12401.pdf"
	"12402.pdf"
	"12403.pdf"
	"Uitspraken2019_deel%205.pdf"
	"12405.pdf"
	"12406.pdf"
	"12407.pdf"
)

FILES_RULINGS_2018=(
	"11784.pdf"
	"11785.pdf"
	"uitspraken2018-deel-3.pdf"
	"uitspraken2018-deel-4.pdf"
	"uitspraken-2018-deel5.pdf"
	"11783.pdf"
)

FILES_RULINGS_2017=(
	"11087.pdf"
	"11088.pdf"
	"Website_studiebetwistingen_3.pdf"
	"11090.pdf"
	"11091.pdf"
	"11092.pdf"
	"11086.pdf"
)

FILES_RULINGS_2016=(
	"7509.pdf"
	"7510.pdf"
	"7511.pdf"
	"7512.pdf"
	"7513.pdf"
	"7514.pdf"
	"7515.pdf"
	"7516.pdf"
	"Website_UitsprakenStudiebeslissingen2016_deel9.pdf"
	"7518.pdf"
	"Website_UitsprakenStudiebeslissingen2016_deel11.pdf"
	"7507.pdf"
	"7508.pdf"
	"7506.pdf"
)

FILES_RULINGS_2015=(
	"7454.pdf"
	"7453.pdf"
	"7452.pdf"
	"7451.pdf"
	"7450.pdf"
	"7449.pdf"
	"7448.pdf"
	"7446.pdf"
	"7445.pdf"
	"7444.pdf"
	"7443.pdf"
	"7442.pdf"
	"7447.pdf"
)

FILES_RULINGS_2014=(
	"7440.pdf"
	"7439.pdf"
	"7438.pdf"
	"7437.pdf"
	"7434.pdf"
	"7435.pdf"
	"7436.pdf"
	"7441.pdf"
)

FILES_RULINGS_2013=(
	"7431.pdf"
	"7432.pdf"
	"7433.pdf"
	"7428.pdf"
	"7429.pdf"
	"7430.pdf"
	"7427.pdf"
)

FILES_RULINGS_2012=(
	"7424.pdf"
	"7425.pdf"
	"7426.pdf"
	"7422.pdf"
	"7423.pdf"
	"7421.pdf"
)

FILES_RULINGS_2011=(
	"7418.pdf"
	"7420.pdf"
	"7419.pdf"
	"7417.pdf"
)

FILES_RULINGS_2010=(
	"7415.pdf"
	"7416.pdf"
)

FILES_RULINGS_2009=(
	"7413.pdf"
	"7414.pdf"
)

FILES_RULINGS_2008=(
	"7412.pdf"
)

FILES_RULINGS_2007=(
	"7411.pdf"
)

FILES_RULINGS_2006=(
	"7409.pdf"
)

FILES_RULINGS_2005=(
	"7408.pdf"
)

FILES_RULINGS2=(
	"FILES_RULINGS_2023"
	"FILES_RULINGS_2022"
	"FILES_RULINGS_2021"
	"FILES_RULINGS_2020"
	"FILES_RULINGS_2019"
	"FILES_RULINGS_2018"
	"FILES_RULINGS_2017"
	"FILES_RULINGS_2016"
	"FILES_RULINGS_2015"
	"FILES_RULINGS_2014"
	"FILES_RULINGS_2013"
	"FILES_RULINGS_2012"
	"FILES_RULINGS_2011"
	"FILES_RULINGS_2010"
	"FILES_RULINGS_2009"
	"FILES_RULINGS_2008"
	"FILES_RULINGS_2007"
	"FILES_RULINGS_2006"
	"FILES_RULINGS_2005"
)

FILES_RULINGS=(
	# 2023
	"Uitspraken2023Website_SB1.pdf"
	"Uitspraken2023Website_SB2.pdf"
	"uitspraken2023_Naric.pdf"
	"Uitspraken2023Website_BeslissingenTeruggaveLeerkredietVerlorenDoorCOVID-19.pdf"

	# 2022
	"Uitspraken2022Website_sb1.pdf"
	"Uitspraken2022Website_sb2.pdf"
	"Uitspraken2022Website_sb3.pdf"
	"Uitspraken2022Website_sb4.pdf"
	"Uitspraken2022Website_sb5.pdf"
	"uitspraken2022_Naric.pdf"
	"Uitspraken2022Website__BeslissingenTeruggaveLeerkredietVerlorenDoorCOVID-19.pdf"

	# 2021
	"Uitspraken2021_sb_deel1.pdf"
	"Uitspraken2021_sb_deel2.pdf"
	"Uitspraken2021_sb_deel3.pdf"
	"Uitspraken2021_sb_deel4.pdf"
	"Uitspraken2021_sb_deel5.pdf"
	"Uitspraken2021.pdf"
	"Uitspraken2021Website_LeerkredietEnOvermacht.pdf"
	"Uitspraken2021Website_BeslissingenTeruggaveLeerkredietVerlorenDoorCOVID-19.pdf"

	# 2020
	"13224.pdf"
	"Uitspraken2020_deel2.pdf"
	"13226.pdf"
	"Uitspraken2020_deel4.pdf"
	"Uitspraken2020_deel5.pdf"
	"Uitspraken2020_deel6.pdf"
	"12969.pdf"

	# 2019
	"12400.pdf"
	"12401.pdf"
	"12402.pdf"
	"12403.pdf"
	"Uitspraken2019_deel%205.pdf"
	"12405.pdf"
	"12406.pdf"
	"12407.pdf"

	# 2018
	"11784.pdf"
	"11785.pdf"
	"uitspraken2018-deel-3.pdf"
	"uitspraken2018-deel-4.pdf"
	"uitspraken-2018-deel5.pdf"
	"11783.pdf"

	# 2017
	"11087.pdf"
	"11088.pdf"
	"Website_studiebetwistingen_3.pdf"
	"11090.pdf"
	"11091.pdf"
	"11092.pdf"
	"11086.pdf"

	# 2016
	"7509.pdf"
	"7510.pdf"
	"7511.pdf"
	"7512.pdf"
	"7513.pdf"
	"7514.pdf"
	"7515.pdf"
	"7516.pdf"
	"Website_UitsprakenStudiebeslissingen2016_deel9.pdf"
	"7518.pdf"
	"Website_UitsprakenStudiebeslissingen2016_deel11.pdf"
	"7507.pdf"
	"7508.pdf"
	"7506.pdf"

	# 2015
	"7454.pdf"
	"7453.pdf"
	"7452.pdf"
	"7451.pdf"
	"7450.pdf"
	"7449.pdf"
	"7448.pdf"
	"7446.pdf"
	"7445.pdf"
	"7444.pdf"
	"7443.pdf"
	"7442.pdf"
	"7447.pdf"

	# 2014
	"7440.pdf"
	"7439.pdf"
	"7438.pdf"
	"7437.pdf"
	"7434.pdf"
	"7435.pdf"
	"7436.pdf"
	"7441.pdf"

	# 2013
	"7431.pdf"
	"7432.pdf"
	"7433.pdf"
	"7428.pdf"
	"7429.pdf"
	"7430.pdf"
	"7427.pdf"

	# 2012
	"7424.pdf"
	"7425.pdf"
	"7426.pdf"
	"7422.pdf"
	"7423.pdf"
	"7421.pdf"

	# 2011
	"7418.pdf"
	"7420.pdf"
	"7419.pdf"
	"7417.pdf"

	# 2010
	"7415.pdf"
	"7416.pdf"

	# 2009
	"7413.pdf"
	"7414.pdf"

	# 2008
	"7412.pdf"

	# 2007
	"7411.pdf"

	# 2006
	"7409.pdf"

	# 2005
	"7408.pdf"
)

# Array of yearly report filenames from 2005 to 2023
FILES_YEARLY_REPORTS=(
	"2005.pdf"
	"2006.pdf"
	"2007.pdf"
	"2008.pdf"
	"2009.pdf"
	"2010.pdf"
	"2011.pdf"
	"2012.pdf"
	"2013.pdf"
	"2014.pdf"
	"2015.pdf"
	"2016.pdf"
	"2017.pdf"
	"2018.pdf"
	"2019.pdf"
	"2020.pdf"
	"2021.pdf"
)

# Create directories if they don't exist
mkdir -p "${DIRECTORY_RULINGS}"
mkdir -p "${DIRECTORY_YEARLY_REPORTS}"

# Download rulings
# download_files_rulings "${BASE_URL_RULINGS}" "${DIRECTORY_RULINGS}" "${FILES_RULINGS2[@]}"

# Download yearly reports
# download_files_yearly_reports "${BASE_URL_YEARLY_REPORTS}" "${DIRECTORY_YEARLY_REPORTS}" "${FILES_YEARLY_REPORTS[@]}"

# Download the 2022 yearly report
# wget https://www.dbrc.be/sites/default/files/2023-10/R.Stvb_._Jaarverslag_2022.pdf -P "${DIRECTORY_YEARLY_REPORTS}"

# Download rulings for each year within the specified range
for ((year=START_YEAR; year<=END_YEAR; year++)); do
    array_name="FILES_RULINGS_${year}[@]"
    download_files "${BASE_URL_RULINGS}" "${DIRECTORY_RULINGS}" "${year}" counter "${!array_name}"
done

# Download yearly reports
download_files "${BASE_URL_YEARLY_REPORTS}" "${DIRECTORY_YEARLY_REPORTS}" "${FILES_YEARLY_REPORTS[@]}"