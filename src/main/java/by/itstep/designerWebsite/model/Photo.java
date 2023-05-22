package by.itstep.designerWebsite.model;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "photos")
public class Photo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message = "{title.empty}")
	private String title;
	
	@NotBlank(message = "{fileName.empty}")
//	@Column(name = "fileName", unique=true)
	private String fileName;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public int hashCode() {
		return Objects.hash(fileName, id, title);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Photo other = (Photo) obj;
		return Objects.equals(fileName, other.fileName) && Objects.equals(id, other.id)
				&& Objects.equals(title, other.title);
	}

	@Override
	public String toString() {
		return "Photo [id=" + id + ", fileName=" + fileName + ", title=" + title + "]";
	}
}