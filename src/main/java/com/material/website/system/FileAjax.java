package com.material.website.system;


/**  
 * @Description: 文件传输对象
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2014年12月25日 下午3:27:18  
 */

public class FileAjax {
	/**
	 * 附件ID
	 */
	private Integer fileId;
	/**
	 * 附件路径
	 */
	private String fullPath;
	
	/**
	 * 文件上传返回信息
	 */
	private String msg;
	/**
	 * @return the fullPath
	 */
	public String getFullPath() {
		return fullPath;
	}
	/**
	 * @param fullPath the fullPath to set
	 */
	public void setFullPath(String fullPath) {
		this.fullPath = fullPath;
	}
	/**
	 * @return the fileId
	 */
	public Integer getFileId() {
		return fileId;
	}
	/**
	 * @param fileId the fileId to set
	 */
	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}
	/**
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}
	/**
	 * @param msg the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
