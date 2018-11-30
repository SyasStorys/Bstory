package kr.bstory.board.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.bstory.board.common.FileVO;
import kr.bstory.board.common.SearchVO;
import kr.bstory.board.service.BoardService;

@Service("BoardService")
@Transactional
@Repository
public class BoardServiceImpl implements BoardService {

	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> selectBoardList(SearchVO params) {
		return sqlSession.selectList("selectSampleBoardList", params);
	}
	
	@Override
	public Integer selectBoardListCnt(SearchVO searchVO) {
		return sqlSession.selectOne("selectSampleBoardListCnt", searchVO);
	}

	@Override
	public Map<String, Object> boardRead(String brdno) {
		
		Map<String, Object> params = null;
		int brdCnt = 0;
		
		if(brdno != null || brdno != "" || brdno != "0") {
			params = sqlSession.selectOne("selectSampleBoardRead", brdno);
			brdCnt = sqlSession.update("selectSampleBoardCnt", brdno);
		}
		
		return params;
	}

	@Override
	public int boardSave(Map<String, Object> params) {
		
		String brdNo = params.get("brd_seq").toString();
		int save = 0;
		
		if(brdNo == null || brdNo == "") {
			save = sqlSession.insert("sampleBoardInsert", params);
		}
		else {
			save += sqlSession.update("sampleBoardUpdate", params);
		}
		
		/*for(FileVO f : filelist) {
			f.setParentPK(brdNo);
			System.out.println("f 읽기 :::" + f);
			sqlSession.insert("sampleBoardInsertFile", f);
		}
		*/
		
		return save;
	}

	@Override
	public int boardDelete(String brdNo) {
		return sqlSession.update("sampleBoardDelete", brdNo);
	}

	
	
	
}
