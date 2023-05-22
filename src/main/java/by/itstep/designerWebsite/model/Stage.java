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
@Table(name = "stages")
public class Stage {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	private String name;

	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "stage_tasks", joinColumns = @JoinColumn(name = "stage_id"))
	@Column(name = "tasks")
	private Set<String> tasks = new HashSet<>();

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

	public Set<String> getTasks() {
		return tasks;
	}

	public void setTasks(Set<String> tasks) {
		this.tasks = tasks;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, name, tasks);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Stage other = (Stage) obj;
		return Objects.equals(id, other.id) && Objects.equals(name, other.name) && Objects.equals(tasks, other.tasks);
	}

	@Override
	public String toString() {
		return "Stage [id=" + id + ", name=" + name + ", tasks=" + tasks + "]";
	}

}
