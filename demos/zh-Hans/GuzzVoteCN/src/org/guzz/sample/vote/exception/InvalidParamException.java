/**
 * InvalidParamException.java created at 2009-9-29 下午02:30:59 by liukaixuan@gmail.com
 */
package org.guzz.sample.vote.exception;

/**
 * 
 * 重复投票异常。
 *
 * @author liukaixuan(liukaixuan@gmail.com)
 */
public class InvalidParamException extends VoteException {

	public InvalidParamException(String msg){
		super(msg) ;
	}
	
}
