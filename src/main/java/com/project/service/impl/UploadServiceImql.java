package com.project.service.impl;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.service.UploadService;


@Service
public class UploadServiceImql implements UploadService {
	@Autowired
	ServletContext app;
	@Override
	public File save(MultipartFile file, String folder) {
		File dir= new File(app.getRealPath(folder));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		String s= System.currentTimeMillis()+file.getOriginalFilename();
		String name =Integer.toHexString(s.hashCode())+s.substring(s.lastIndexOf("."));
		try {
			File saFile= new File(dir,name);
			file.transferTo(saFile);
			System.out.println(saFile.getAbsolutePath());
			return saFile;
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
		
	}

}
