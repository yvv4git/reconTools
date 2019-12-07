function CreateDir() {
    dt=`date +'%Y%m%d'`;
    srcDir=$(pwd)'/dump/'$1;
    resultDir=$srcDir'/'$dt;
    
    if [ ! -d "$resultDir" ]; then
        mkdir -p $resultDir;
    fi
    
    echo $resultDir;
    #return $(($resultDir));
}
