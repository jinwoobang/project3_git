package com.bjw.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {
	
	public DownloadView() {
		// 객체가 생성될 때 content type을 다음과 같이 변경
		this.setContentType("application/download;utf-8");
	}
	

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType(this.getContentType());
		File file=(File)model.get("action"); //전송받은 모델(파일 정보)
		response.setContentLength((int)file.length());
		String userAgent=request.getHeader("User-Agent"); //브라우저, 운영체제 정보
		
		String filename="";
		filename=new String(file.getName().getBytes());
		response.setHeader("Content-Disposition", "attachment;fileName=\""+filename); //Content-Disposition속성 이용 / 데이터 형식 지정 / attachment로 지정되어 있는 첨부파일 을 말함
		response.setHeader("Content-Transfer-Encoding", "binary"); // 전송되는 데이터의 안에 내용물들의 인코딩 방식  = binary 방식을 택함
		
		OutputStream out=response.getOutputStream();
		FileInputStream fis=null;
		try {
			fis=new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		out.flush();
	}

	
}

