package kr.bstory.board.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.bstory.board.common.FileUtil;
import kr.bstory.board.common.FileVO;
import kr.bstory.board.common.SearchVO;
import kr.bstory.board.service.BoardService;

@Controller
@RequestMapping(value="/board/")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;
	
	/**
	 * 게시판 리스트1
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="boardList.ino", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ModelAndView boardList(Map<String, Object> params, SearchVO searchVO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
			
		searchVO.pageCalculate( boardService.selectBoardListCnt(searchVO) ); // startRow, EndRow
		List<Map<String, Object>> listview = boardService.selectBoardList(searchVO);
		
		mv.setViewName("sample/board/boardList");
		mv.addObject("listview",listview);
		mv.addObject("searchVO",searchVO);
			
		return mv;
	}
	
	/**
	 * 게시판 읽기1
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="boardRead.ino", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ModelAndView boardForm(@RequestParam Map<String, Object> params) throws Exception {
		
		String brdno = params.get("brd_seq").toString();
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> result = boardService.boardRead(brdno);
		mv.setViewName("sample/board/boardForm");
		
		if(result != null) {
			mv.addObject("result", result);
		}
		
		return mv;
	}
	
	/**
	 * 게시판 작성1
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="boardFormWrite.ino", method={RequestMethod.GET, RequestMethod.POST})
	public String boardForm2(@RequestParam Map<String, Object> params) throws Exception {
		return "sample/board/boardForm";
	}
	
	/**
	 * 게시판 저장1
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="boardSave.ino", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardSave(@RequestParam Map<String, Object> params) throws Exception {
		
		logger.info("params::::::::::" + params);
		
		ModelAndView mv = new ModelAndView();
		
		int rcode = boardService.boardSave(params);
		
		if(rcode == 0) {
			throw new Exception();
		}
		
		mv.setViewName("redirect:boardList.ino");
		
		return mv;
	}
	
	/**
	 * 게시판 삭제1
	 * @param params
	 * @return
	 */
	@RequestMapping(value="boardDelete.ino", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardDelete(@RequestParam Map<String, Object> params) {
		
		String brdNo = params.get("brd_seq").toString();
		
		ModelAndView mv = new ModelAndView();
		
		boardService.boardDelete(brdNo);
		
		mv.setViewName("redirect:boardList.ino");
		
		return mv;
	}

}
