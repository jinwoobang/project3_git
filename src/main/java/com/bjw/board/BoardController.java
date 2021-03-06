package com.bjw.board;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	@Inject
	private BoardService service;
	
	@RequestMapping(value="noticeWriter.do")
	public String insertBoard(BoardBean bean,@RequestParam(value="file")MultipartFile file) throws Exception{
		System.out.println(bean);
		String loc="C:\\Webproject\\project3\\Web\\src\\main\\webapp\\upload\\";		
		FileOutputStream fos=null;
		String filename=file.getOriginalFilename();
		//System.out.println(filename);
		if(filename.length()>0) {
			try {
				fos=new FileOutputStream(new File(loc+filename));
				fos.write(file.getBytes());
				bean.setFilename(filename);
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				try {
					fos.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
		}
		service.insertBoard(bean);
		return "redirect:boardList.do";
	}
	@RequestMapping(value="boardList.do")
	public String listBoard(Model model, String page) throws Exception{
		PageBean pageBean = service.pageing(page);
		model.addAttribute("list",service.selectBoard(pageBean.getStart(),pageBean.getEnd()));
		model.addAttribute("pageBean", pageBean);
		System.out.println(page);
		return "Project/other/notice";
	}
	
	@RequestMapping(value="selectInfo.do")
	public String selectInfo(int no,String job,Model model,String filenamez) throws Exception {
		if(job!=null && job.equals("ninfo")) {
			service.updateHitBoard(no);
			//model.addAttribute("list",service.selectBoard());
			model.addAttribute("selectInfo",service.selectInfo(no));
			return "Project/other/noticeInfo";
		}
		return "Project/other/notice";
	}
	
	@RequestMapping(value="boardDelete.do")
	public String deleteBoard(int no) throws Exception {
		service.deleteBoard(no);
		return "redirect:boardList.do";
	}
	
	@RequestMapping(value="boardModify.do")
	public String boardModify(Model model,int no) throws Exception {
		//model.addAttribute("list",service.selectBoard());
		model.addAttribute("selectInfo",service.selectInfo(no));
		return "Project/other/noticeModify";
	}
	
	@RequestMapping(value="Modifyboard.do")
	public String modifyBoard(BoardBean bean,Model model,int no,@RequestParam(value="file")MultipartFile file,String filemod) throws Exception {
		System.out.println(bean);
		System.out.println(no);
		System.out.println(filemod);
		String loc="C:\\Webproject\\project3\\Web\\src\\main\\webapp\\upload\\";		
		FileOutputStream fos=null;
		
		if(filemod!=null) {
			//String filename=filemod;
			bean.setFilename(filemod);
		}
		
		String filename=file.getOriginalFilename();
		//System.out.println(filename);
		if(filename.length()>0) {
			try {
				fos=new FileOutputStream(new File(loc+filename));
				fos.write(file.getBytes());
				//bean.setFileName(fileName);
				//bean.setFilename(file.getOriginalFilename());
				bean.setFilename(filename);
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				try {
					fos.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
		}
	
		service.modifyBoard(bean);
		return "redirect:boardList.do"; 
		//System.out.println(bean);
	}
	
	@RequestMapping(value="new.do")
	public String newOrder(Model model,String page) throws Exception {
		String cmd="ordernew";
		model.addAttribute("cmd",cmd);
		PageBean pageBean = service.pageing(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("list",service.newOrder(pageBean.getStart(),pageBean.getEnd()));
		return "Project/other/notice";
	}
	
	@RequestMapping(value="old.do")
	public String oldOrder(Model model,String page) throws Exception {
		String cmd="orderold";
		model.addAttribute("cmd",cmd);
		PageBean pageBean = service.pageing(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("list",service.oldOrder(pageBean.getStart(),pageBean.getEnd()));
		return "Project/other/notice";
	}
	
	@RequestMapping(value="noticeSearch.do")
	public String searchBoard(String search,String query,Model model,String page) throws Exception {
		String cmd="search";
		model.addAttribute("cmd",cmd);
		System.out.println(query);
		System.out.println(page);
		PageBean pageBean = service.pageing(page);
		model.addAttribute("pageBean", pageBean); 
		/*model.addAttribute("list",service.searchBoard(search));*/
		//model.addAttribute("list",service.searchBoard(search,query));
		model.addAttribute("list",service.searchBoard(search,query,pageBean.getStart(),pageBean.getEnd()));
		model.addAttribute("search",search);
		model.addAttribute("query",query);
		return "Project/other/notice";
	}
	
	@RequestMapping(value="downloadAction.do")
	public ModelAndView downloadStream(String filename) throws Exception {
		String loc="C:\\Webproject\\project3\\Web\\src\\main\\webapp\\upload\\";
		System.out.println(filename);
		File file=new File(loc+filename);
		HashMap<String, File>map=new HashMap<>();
		map.put("action", file);
		return new ModelAndView("download",map); //download??? servlet-context??? download??? ????????? ???(DownloadView.java)
	}
	
	
	
	
}
