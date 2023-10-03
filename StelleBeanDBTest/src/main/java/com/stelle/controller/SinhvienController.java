package com.stelle.controller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.Query;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.stelle.data.Sinhvien;
import com.stelle.service.SinhvienService;

@Controller
@RequestMapping("/sinhvien")
public class SinhvienController {
	@Autowired
	SinhvienService sinhvienservice;
	@GetMapping("/listSinhvien")
	public String listSinhvien(Model model,Integer offset, Integer maxResults, @RequestParam(value = "keyword", required = false) String keyword,@RequestParam(value = "lopStelle", required = false) String lopStelle) {
		System.out.println("_____________" + keyword);
		List<Sinhvien> thesinhvien=sinhvienservice.getSinhvien(offset,maxResults, keyword,lopStelle);
//		for(Sinhvien sv : thesinhvien) {
//		System.out.println(sv.getId());
//		System.out.println(sv.getTen_sinh_vien());
//		System.out.println(sv.getId_lop());
//		}
		model.addAttribute("count", sinhvienservice.count(keyword,lopStelle));
		model.addAttribute("sinhvien",thesinhvien);
		model.addAttribute("offset", offset);
		model.addAttribute("keyword", keyword);
		model.addAttribute("lopStelle", lopStelle);
		model.addAttribute("maxResults", maxResults);
		return "list-sinhvien";
	}
	@GetMapping("/addSinhvien")
	public String addSinhvien(Model model) {
		Sinhvien sinhvien =new Sinhvien();
		System.out.println(sinhvien.getId());
		System.out.println(sinhvien.getTen_sinh_vien());
		System.out.println(sinhvien.getId_lop());
		model.addAttribute("sinhvien", sinhvien);
		return "Sinhvien-form";
	}
	@PostMapping("/saveSinhvien")
	public String SaveSinhvien(@ModelAttribute("sinhvien")Sinhvien isSinhvien) {
		sinhvienservice.saveSinhvien(isSinhvien);
		return "redirect:/sinhvien/listSinhvien";
	}
	@GetMapping("/updateSinhvien")
	public String UpdateSinhvien(@RequestParam("sinhvienID") int isID,Model model) {
		Sinhvien sinhvien = sinhvienservice.getSinhvien(isID);
		model.addAttribute("sinhvien", sinhvien);
		return "Sinhvien-form";
	}
	@GetMapping("deleteSinhvien")
	public String deleteSinhvien(@RequestParam("sinhvienID") int isID, Model model) {
		sinhvienservice.deleteSinhvien(isID);
		
		return "redirect:/sinhvien/listSinhvien";
	}

	@RequestMapping("/listSinhviend")
	public @ResponseBody String searchSinhvien(@RequestParam(value = "ten_sinh_vien", required = false) String ten_sinh_vien,@RequestParam(value = "lop_id", required = false) String lop_id) {
		System.out.println("#####################" + ten_sinh_vien);
		System.out.println("#####################" + lop_id);
		List<Sinhvien> thesinhvien=sinhvienservice.getSinhvien(1,100, ten_sinh_vien,lop_id);
		/*JSONArray arr = new JSONArray();
		for(Sinhvien sv : thesinhvien) {
		JSONObject obj = new JSONObject();
			obj.put("ten", sv.getTen_sinh_vien());
			obj.put("id", sv.getId());
			obj.put("id_lop", sv.getId_lop());
		arr.put(obj);
	}*/
		//return thesinhvien.subList(1, 100);
		return new Gson().toJson(thesinhvien).toString();
    }
}