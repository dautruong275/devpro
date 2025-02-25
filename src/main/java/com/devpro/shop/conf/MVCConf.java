package com.devpro.shop.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.devpro.shop.Constants;

@Configuration // -> đây là 1 BEAN cho loại Cấu hình.
public class MVCConf implements WebMvcConfigurer, Constants {
	
	/***
	 * Thực hiện định nghĩa các static resources.
	 * classpath: tương ứng với folder: src/main/resources
	 */
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");
		
		//đăng kí thêm static resources cho ảnh attach đẩy lên
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + UPLOAD_FOLDER_ROOT);
	}
	
	@Bean // -> BEAN này dùng để chỉ ra thư mục chứa Views
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		//thiết lập view engine
		bean.setViewClass(JstlView.class);
		
		// Đường dẫn folder chứa Views.
		bean.setPrefix("/WEB-INF/views/");
		
		// Tên đuôi của View
		bean.setSuffix(".jsp");
		
		return bean;
	}
	
}
