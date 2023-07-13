package by.itstep.designerWebsite.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import by.itstep.designerWebsite.model.Photo;
import by.itstep.designerWebsite.repository.PhotoRepository;

@Controller
public class UploadController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	private PhotoRepository photoRepository;

	@PostMapping("/portfolio")
	public String handleFileUpload(@RequestParam(name = "file", required = false) MultipartFile multipartFile,
			@Valid @ModelAttribute Photo photo, BindingResult result, Model model) throws IOException {

		if (multipartFile.getOriginalFilename() != null && !multipartFile.getOriginalFilename().isEmpty()) {
			InputStream inputStream = multipartFile.getInputStream();
			byte[] buf = new byte[51200];
			String path = servletContext.getContextPath();
			File file = new File(path);
			String basePath = file.getCanonicalPath();

			String fileName = multipartFile.getOriginalFilename();

			if (photoRepository.findPhotoByFileName(fileName) != null) {
				do {
					StringBuilder sb = new StringBuilder(fileName);
					String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss_")
							.format(Calendar.getInstance().getTime());
					sb.insert(0, timeStamp);
					fileName = sb.toString();
				} while (photoRepository.findPhotoByFileName(fileName) == null);
			}

			String fullPath = basePath + "\\src\\main\\resources\\static\\img\\" + fileName;
			FileOutputStream fileOutputStream = new FileOutputStream(fullPath);

			int numRead = 0;
			while ((numRead = inputStream.read(buf)) >= 0) {
				fileOutputStream.write(buf, 0, numRead);
			}

			inputStream.close();
			fileOutputStream.close();
			photo.setFileName(fileName);
		}

		if (result.hasErrors()) {
			return "save";
		}

		photoRepository.save(photo);
		model.addAttribute("photo", new Photo());
		model.addAttribute("message", "Фото сохранено в портфолио");
		return "save";
	}

	@GetMapping("/img/{fileName}")
	@ResponseBody
	public HttpEntity<byte[]> getPhoto(@PathVariable String fileName) throws IOException {
		String path = servletContext.getContextPath();
		File file = new File(path);
		String basePath = file.getCanonicalPath();
		String fullPath = basePath + "\\src\\main\\resources\\static\\img\\" + fileName;
		byte[] image = org.apache.commons.io.FileUtils.readFileToByteArray(new File(fullPath));

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		headers.setContentLength(image.length);
		return new HttpEntity<byte[]>(image, headers);
	}
}
