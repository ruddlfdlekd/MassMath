package com.math.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileSaver {
	
	public List<String> saver(MultipartFile [] f1, String filepath)throws Exception{
		List<String> fileNames = new ArrayList<String>();
		for(MultipartFile f: f1){	
			String fileName=this.saver(f, filepath);
			fileNames.add(fileName);
		}
		return fileNames;
	}
	
	public String saver(MultipartFile f1, String filepath)throws Exception{
		//1. 저장할 파일명 생성
		//iu.jpg
		System.out.println("String saver");
		System.out.println("f1:"+ f1);
		String fileName= f1.getOriginalFilename();
		
		if(f1.getOriginalFilename()!=""){
		fileName=fileName.substring(fileName.lastIndexOf("."));
		fileName=UUID.randomUUID().toString()+fileName;
		//fileName=UUID.randomUUID().toString()+"_"+fileName;
		File f = new File(filepath, fileName);
		//FileCopyUtils.copy(file.getBytes(), f);
		f1.transferTo(f);
		}
		return fileName;
	}

}
