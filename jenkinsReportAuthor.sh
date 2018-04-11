#!/bin/bash
set -o errexit
set -o nounset

jobName="${1:?enter job name}"
jenkinsURL="https://jenkins.cc.dev.aws.symcpe.com"
excelSheetName="report.csv"

echo "COMMIT_ID,COMMIT_AUTHOR_NAME,COMMIT_MSG" > $excelSheetName

COMMIT_ID=$(curl -u ram_kannan:Sym#16info2020 --silent $jenkinsURL/job/$jobName/lastBuild/api/json?pretty=true | grep -e "commitId" | cut -d : -f2 | tr ' ' '+') 
COMMIT_AUTHOR_NAME=$(curl -u ram_kannan:Sym#16info2020 --silent $jenkinsURL/job/$jobName/lastBuild/api/json?pretty=true | grep -e "fullName" | cut -d : -f2 | xargs | tr ' ' '+') 
COMMIT_MSG=$(curl -u ram_kannan:Sym#16info2020 --silent $jenkinsURL/job/$jobName/lastBuild/api/json?pretty=true | grep -e "msg" | cut -d : -f2)

echo "$COMMIT_ID,$COMMIT_AUTHOR_NAME,$COMMIT_MSG" >> $excelSheetName
