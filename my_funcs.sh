#!/bin/bash

get_pvt_build()
{
  if [[ "$#" < 1 ]]; then
    echo "Insufficient Num of Args"
    echo "Usage: $0 <build number> <destination>"
    echo "Ex $0 595"
    return 1
  fi

  local buildNum=$1
  local dst="."
  local buildbotPath="/srv/samba/builds/amba-rtos/pvt"
  if [[ "$#" == 2 ]]; then
    dst=$2
  fi
  if [[ ! -d $dst ]]; then
    mkdir -p "$dst"
  fi
  scp -P 27830 kartik@homebase.rylo.io:$buildbotPath/amba-rtos_$buildNum.tgz $dst
  if [[ $? == 0 ]]; then
    echo "Successfully Downloaded"
    return 0
  else
    echo "Failed to Download"
    return 1
  fi
  return 0
}

get_factory_build()
{
  if [[ "$#" < 1 ]]; then
    echo "Insufficient Num of Args"
    echo "Usage: $0 <build number> <destination>"
    echo "Ex $0 595"
    return 1
  fi

  local buildNum=$1
  local dst="."
  local buildbotPath="/srv/samba/builds/factory-rtos/pvt"
  if [[ "$#" == 2 ]]; then
    dst=$2
  fi
  if [[ ! -d $dst ]]; then
    mkdir -p "$dst"
  fi
  scp -P 27830 kartik@homebase.rylo.io:$buildbotPath/factory-rtos_prq_$buildNum.tgz $dst
  if [[ $? == 0 ]]; then
    echo "Successfully Downloaded"
    return 0
  else
    echo "Failed to Download"
    return 1
  fi
  return 0
}
