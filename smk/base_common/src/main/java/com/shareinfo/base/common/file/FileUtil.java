/*
 * %W% %E%
 *
 * Copyright (c)
 */
package com.shareinfo.base.common.file;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
/**
 * @ClassName: FileUtil
 * @Description: TODO
 * @author Huangpeng@shareinfo.com.cn
 * @date 2013-7-17 上午10:41:32
 * 
 */
public class FileUtil {

	private static final Log logger = LogFactory.getLog(FileUtil.class);
	
	public static final int BUFFER_SIZE = 4096;

	/**
	 * 
	 * @Title: copy
	 * @Description: 拷贝输入文件内容到输出文件
	 * @param @param in
	 * @param @param out
	 * @param @throws IOException
	 * @return void
	 * @throws
	 */
	public static void copy(File in, File out) throws IOException {
		copy(new BufferedInputStream(new FileInputStream(in)),
				new BufferedOutputStream(new FileOutputStream(out)));
	}

	/**
	 * 
	 * @Title: copy
	 * @Description: 拷贝输入流到输出流，当完成后关闭流。
	 * @param @param in
	 * @param @param out
	 * @param @throws IOException
	 * @return void
	 * @throws
	 */
	public static void copy(InputStream in, OutputStream out)
			throws IOException {
		try {
			byte[] buffer = new byte[BUFFER_SIZE];
			int nrOfBytes = -1;
			while ((nrOfBytes = in.read(buffer)) != -1)
				out.write(buffer, 0, nrOfBytes);
			out.flush();
		} finally {
			try {
				in.close();
			} catch (IOException ex) {
				logger.warn("Could not close InputStream", ex);
			}
			try {
				out.close();
			} catch (IOException ex) {
				logger.warn("Could not close OutputStream", ex);
			}
		}
	}
}
