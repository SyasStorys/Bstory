package kr.bstory.board.service;

import java.util.List;
import java.util.Map;

import kr.bstory.board.common.FileVO;
import kr.bstory.board.common.SearchVO;

public interface BoardService {

	List<Map<String, Object>> selectBoardList(SearchVO params);

	Map<String, Object> boardRead(String brdno);

	int boardSave(Map<String, Object> params);

	int boardDelete(String brdNo);

	Integer selectBoardListCnt(SearchVO searchVO);

}
