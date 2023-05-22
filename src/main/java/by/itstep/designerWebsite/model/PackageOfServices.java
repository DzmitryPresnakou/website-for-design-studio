package by.itstep.designerWebsite.model;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "packages")
public class PackageOfServices {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	private String name;

	private Integer price;

	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "package_services", joinColumns = @JoinColumn(name = "package_id"))
	@Column(name = "services")
	private Set<String> services = new HashSet<String>();

	private String description;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Set<String> getServices() {
		return services;
	}

	public void setServices(Set<String> services) {
		this.services = services;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public int hashCode() {
		return Objects.hash(description, id, name, price, services);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PackageOfServices other = (PackageOfServices) obj;
		return Objects.equals(description, other.description) && Objects.equals(id, other.id)
				&& Objects.equals(name, other.name) && Objects.equals(price, other.price)
				&& Objects.equals(services, other.services);
	}

	@Override
	public String toString() {
		return "PackageOfServices [id=" + id + ", name=" + name + ", price=" + price + ", services=" + services
				+ ", description=" + description + "]";
	}

}
