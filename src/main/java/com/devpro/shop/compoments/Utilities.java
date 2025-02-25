package com.devpro.shop.compoments;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.github.slugify.Slugify;

public class Utilities {
	public static String slugify(String text) {
		return new Slugify().slugify(text);
	}
	public static void main(String[] args) {
		String productTitle = "Java Title 6"; // -> java-title-6
		String productTitleSeo = new Slugify().slugify(productTitle);
		System.out.println(productTitleSeo);
		System.out.println(new BCryptPasswordEncoder(4).encode("admin"));
	}
}
