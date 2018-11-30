package kr.bstory.board.common;

public class FileVO {
    private Integer file_no; 
    private String parentPK;
    private String file_name;
    private String real_name;
    private long file_size;
    
    
    /**
     * 파일 크기를 정형화하기.
     */
    public String size2String() {
        Integer unit = 1024;
        if (file_size < unit) {
            return String.format("(%d B)", file_size);
        }
        int exp = (int) (Math.log(file_size) / Math.log(unit));

        return String.format("(%.0f %s)", file_size / Math.pow(unit, exp), "KMGTPE".charAt(exp - 1));
    }
    
    public Integer getFile_no() {
		return file_no;
	}

	public void setFile_no(Integer file_no) {
		this.file_no = file_no;
	}


	public String getParentPK() {
		return parentPK;
	}


	public void setParentPK(String parentPK) {
		this.parentPK = parentPK;
	}


	public String getFile_name() {
		return file_name;
	}


	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}


	public String getReal_name() {
		return real_name;
	}


	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}


	public long getFile_size() {
		return file_size;
	}


	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}

    
}
