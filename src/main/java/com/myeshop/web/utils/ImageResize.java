package com.myeshop.web.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;

import com.myeshop.domain.ImageFormat;

public class ImageResize {
	
	private ImageResize() {}
	
	public static BufferedImage resize(String pathNameSource, String pathNameDest, int height, ImageFormat imageFormat) {
		BufferedImage resizeImagePng = null;
		try {
			BufferedImage originalImage = ImageIO.read(new File(pathNameSource));
			int width = (int) Math.round((originalImage.getWidth() * height) * 1.0 / originalImage.getHeight());
			resizeImagePng = resizeWithScalr(originalImage, width, height);
			ImageIO.write(resizeImagePng, imageFormat.toString().toLowerCase(), new File(pathNameDest));
		} catch(IOException e) {
			e.printStackTrace();
		}
		return resizeImagePng;
	}
	
	
//	private static BufferedImage resizeWithHint(BufferedImage originalImage, int width, int height, int type) {
//		BufferedImage resizedImage = new BufferedImage(width, height, type);
//		Graphics2D g = resizedImage.createGraphics();
//		g.drawImage(originalImage, 0, 0, width, height, null);
//		g.dispose();
//		g.setComposite(AlphaComposite.Src);
//		
//		g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
//		g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
//		g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
//		
//		return resizedImage;
//	}
	
	private static BufferedImage resizeWithScalr(BufferedImage originalImage, int width, int height) {
		BufferedImage resizedImage = Scalr.resize(originalImage, 
				Scalr.Method.QUALITY, 
				Scalr.Mode.FIT_EXACT,
				width, 
				height, 
				Scalr.OP_ANTIALIAS); 
		
		return resizedImage;
	}
}
