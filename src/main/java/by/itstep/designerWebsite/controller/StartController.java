package by.itstep.designerWebsite.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import by.itstep.designerWebsite.model.PackageOfServices;
import by.itstep.designerWebsite.model.Photo;
import by.itstep.designerWebsite.model.User;
import by.itstep.designerWebsite.model.Stage;
import by.itstep.designerWebsite.repository.PackageRepository;
import by.itstep.designerWebsite.repository.PhotoRepository;
import by.itstep.designerWebsite.repository.UserRepository;
import by.itstep.designerWebsite.repository.StageRepository;

@Controller
public class StartController {

	@Autowired
	private PhotoRepository photoRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PackageRepository packageRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private StageRepository stageRepository;

	@PostConstruct
	public void init() {
		Photo photo1 = new Photo();
		photo1.setFileName("1001.jpg");
		photo1.setTitle("Victoria");
		Photo photo2 = new Photo();
		photo2.setFileName("1002.jpg");
		photo2.setTitle("Victoria");
		Photo photo3 = new Photo();
		photo3.setFileName("1003.jpg");
		photo3.setTitle("Victoria");
		Photo photo4 = new Photo();
		photo4.setFileName("1004.jpg");
		photo4.setTitle("Victoria");
		Photo photo5 = new Photo();
		photo5.setFileName("1005.jpg");
		photo5.setTitle("Victoria");
		Photo photo6 = new Photo();
		photo6.setFileName("1006.jpg");
		photo6.setTitle("Victoria");
		Photo photo7 = new Photo();
		photo7.setFileName("1007.jpg");
		photo7.setTitle("Victoria");
		Photo photo8 = new Photo();
		photo8.setFileName("1008.jpg");
		photo8.setTitle("Victoria");
		Photo photo9 = new Photo();
		photo9.setFileName("1009.jpg");
		photo9.setTitle("Victoria");
		Photo photo10 = new Photo();
		photo10.setFileName("1010.jpg");
		photo10.setTitle("Victoria");
		Photo photo11 = new Photo();
		photo11.setFileName("1011.jpg");
		photo11.setTitle("Victoria");
		Photo photo12 = new Photo();
		photo12.setFileName("1012.jpg");
		photo12.setTitle("Victoria");
		Photo photo13 = new Photo();
		photo13.setFileName("1013.jpg");
		photo13.setTitle("Zrobim");
		Photo photo14 = new Photo();
		photo14.setFileName("1014.jpg");
		photo14.setTitle("Zrobim");
		Photo photo15 = new Photo();
		photo15.setFileName("1015.jpg");
		photo15.setTitle("Zrobim");
		Photo photo16 = new Photo();
		photo16.setFileName("1016.jpg");
		photo16.setTitle("Zrobim");
		Photo photo17 = new Photo();
		photo17.setFileName("1017.jpg");
		photo17.setTitle("Zrobim");
		Photo photo18 = new Photo();
		photo18.setFileName("1018.jpg");
		photo18.setTitle("Zrobim");

		photoRepository.save(photo1);
		photoRepository.save(photo2);
		photoRepository.save(photo3);
		photoRepository.save(photo4);
		photoRepository.save(photo5);
		photoRepository.save(photo6);
		photoRepository.save(photo7);
		photoRepository.save(photo8);
		photoRepository.save(photo9);
		photoRepository.save(photo10);
		photoRepository.save(photo11);
		photoRepository.save(photo12);
		photoRepository.save(photo13);
		photoRepository.save(photo14);
		photoRepository.save(photo15);
		photoRepository.save(photo16);
		photoRepository.save(photo17);
		photoRepository.save(photo18);

		User admin = new User();
		admin.setName("admin");
		admin.setPassword(passwordEncoder.encode("admin"));
		admin.setRole("ADMIN");
		userRepository.save(admin);

		PackageOfServices package1 = new PackageOfServices();
		package1.setName("ПЛАНИРОВОЧНОЕ РЕШЕНИЕ");
		package1.setPrice(5);
		package1.setDescription(
				"В результате Вы получаете необходимую информацию для начала ремонтных работ за короткий срок и по приемлемой цене");
		Set<String> services1 = new HashSet<>();
		services1.add("Замеры помещения");
		services1.add("Разработка планировки (не менее 3-х вариантов)");
		services1.add("План демонтажа и монтажа перегородок (при необходимости)");
		services1.add("План расстановки мебели с размерами");
		services1.add("План сантехники");
		services1.add("План розеток и выключателей");
		services1.add("План освещения");
		services1.add("Режим включения");
		package1.setServices(services1);
		packageRepository.save(package1);
		PackageOfServices package2 = new PackageOfServices();
		package2.setName("ДИЗАЙН-КОНЦЕПЦИЯ");
		package2.setPrice(17);
		package2.setDescription(
				"В результате вы получаете полное представление о будущем интерьере, его стилистике, цветовой гамме, материалах и мебели, полный пакет чертежей");
		Set<String> services2 = new HashSet<>();
		services2.add("Разработка планировки (не менее 3-х вариантов)");
		services2.add("Создание концепции будущего интерьера");
		services2.add(
				"1-2 варианта коллажа на каждое помещение с использованием конкретных материалов (плитки, обоев и т.д), мебели, освещения");
		services2.add("План оборудования");
		services2.add("План демонтажа");
		services2.add("План монтажа перегородок");
		services2.add("План ГКЛ конструкций");
		services2.add("План сантехники");
		services2.add("План теплого пола");
		services2.add("План раскладки напольных покрытий");
		services2.add("План потолка");
		services2.add("План осветительных приборов");
		services2.add("План розеток и выключателей, режим включения");
		services2.add("План привязки электрики к мебели");
		services2.add("Развертки стен");
		services2.add("Чертежи мебели");
		services2.add("Раскладка плитки в ванной");
		services2.add("Авторский надзор и выбор материалов бесплатно");
		package2.setServices(services2);
		packageRepository.save(package2);

		PackageOfServices package3 = new PackageOfServices();
		package3.setName("ПОЛНЫЙ ДИЗАЙН ПРОЕКТ");
		package3.setPrice(25);
		package3.setDescription("Включает в себя два предыдущих варианта + 3D‑визуализация");
		Set<String> services3 = new HashSet<>();
		services3.add("Разработка планировки (не менее 3-х вариантов)");
		services3.add("Создание концепции будущего интерьера");
		services3.add(
				"1-2 варианта коллажа на каждое помещение с использованием конкретных материалов (плитки, обоев и т.д), мебели, освещения");
		services3.add("План оборудования");
		services3.add("План демонтажа");
		services3.add("План монтажа перегородок");
		services3.add("План ГКЛ конструкций");
		services3.add("План сантехники");
		services3.add("План теплого пола");
		services3.add("План раскладки напольных покрытий");
		services3.add("План потолка");
		services3.add("План осветительных приборов");
		services3.add("План розеток и выключателей, режим включения");
		services3.add("План привязки электрики к мебели");
		services3.add("Развертки стен");
		services3.add("Чертежи мебели");
		services3.add("Раскладка плитки в ванной");
		services3.add("Авторский надзор и выбор материалов бесплатно");
		services3.add("3D-визуализация");
		package3.setServices(services3);
		packageRepository.save(package3);

		Stage step1 = new Stage();
		step1.setName("Шаг 1: Планировочное решение");
		Set<String> tasks1 = new HashSet<>();
		tasks1.add("Встреча с заказчиком, замеры помещения, обсуждение пожеланий и рекомендаций дизайнеру заказчиком");
		tasks1.add("Обсуждение стиля, цветовой гаммы, функциональной наполненности каждого помещения");
		step1.setTasks(tasks1);
		stageRepository.save(step1);

		Stage step2 = new Stage();
		step2.setName("Шаг 2: Концепция будущего интерьера");
		Set<String> tasks2 = new HashSet<>();
		tasks2.add("Создание концепции будущего интерьера");
		tasks2.add("Разработка планировочного решения");
		tasks2.add("Согласование этого этапа с заказчиком");
		tasks2.add("При необходимости внесение правок в планировочное решение");
		tasks2.add("Утверждение планировочного решения");
		step2.setTasks(tasks2);
		stageRepository.save(step2);

		Stage step3 = new Stage();
		step3.setName("Шаг 3: 3D-визуализация");
		Set<String> tasks3 = new HashSet<>();
		tasks3.add("Создание 3D визуализации – реалистичного изображения интерьера");
		tasks3.add("Согласовываем проделанную работу с заказчиком");
		tasks3.add("При необходимости делаем 1-2 правки (они входят в стоимость дизайн проекта)");
		tasks3.add("Если необходимы дополнительные корректировки, они оплачиваются отдельно");
		step3.setTasks(tasks3);
		stageRepository.save(step3);

		Stage step4 = new Stage();
		step4.setName("Шаг 4: Разработка чертежей");
		Set<String> tasks4 = new HashSet<>();
		tasks4.add(
				"После согласования визуализации мы делаем рабочие чертежи – разрабатываем полный пакет чертежей для строительной бригады");
		step4.setTasks(tasks4);
		stageRepository.save(step4);

		Stage step5 = new Stage();
		step5.setName("Шаг 5: Авторский надзор");
		Set<String> tasks5 = new HashSet<>();
		tasks5.add("Очень важный этап работы");
		tasks5.add("После окончания работы над чертежами, наступает период реализации");
		tasks5.add("Мы общаемся со строителями на объекте");
		tasks5.add("Проводим консультации на всех этапах ремонта");
		tasks5.add("Подбираем материалы, выезжаем с заказчиком в магазины и салоны города");
		tasks5.add("Консультируем производителей мебели");
		step5.setTasks(tasks5);
		stageRepository.save(step5);

	}

	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("photos", photoRepository.findByOrderByTitle());
		model.addAttribute("packages", packageRepository.findAll());
		model.addAttribute("stages", stageRepository.findAll());
		return "home";
	}

	@GetMapping("/about")
	public String about() {
		return "about";
	}

	@GetMapping("/portfolio")
	public String getAllPhotos(Model model) {
		model.addAttribute("photos", photoRepository.findByOrderByTitle());
		return "portfolio";
	}

	@GetMapping("/portfolio/delete/{id}")
	public String delete(@PathVariable Long id) {
		photoRepository.deleteById(id);
		return "redirect:/portfolio";
	}

	@GetMapping("/save")
	public String save(Model model) {
		model.addAttribute("photo", new Photo());
		return "save";
	}

	@GetMapping("/{id}")
	public String update(@PathVariable Long id, Model model) {
		Photo photo = photoRepository.findById(id).get();
		model.addAttribute("photo", photo);
		return "save";
	}

}
