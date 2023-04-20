package com.augusto.lookify.controllers;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.augusto.lookify.models.Song;
import com.augusto.lookify.services.LookifyServices;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/dashboard")
public class DashboardController {
    private final LookifyServices lookifyServices;

    @RequestMapping("")
    public String songsDashboard(Model model) {
        List<Song> songs = lookifyServices.allSongs();
        model.addAttribute("songs", songs);
        return "dashboard";
    }

    @RequestMapping("/new")
    public String newSong(@ModelAttribute("song") Song song) {
        return "newSong";
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public String createSong(
        @Valid @ModelAttribute("song") Song song, 
        BindingResult result) {
        if (result.hasErrors()) {
            return "newSong";
        } else {
            lookifyServices.createSong(song);
        }
        return "redirect:/dashboard";
    }

    @RequestMapping(value="/{id}", method =RequestMethod.GET)
    public String show(Model model, @PathVariable(value="id") Long id) {
        Song song = lookifyServices.findSong(id);
        model.addAttribute("song", song);
        return"showSong";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
        lookifyServices.deleteSong(id);
        return "redirect:/dashboard";
    }

    //Mostrar rating de artistas en orden descentiende
    @RequestMapping("/top")
    public String topTen(Model model) {
        List<Song> songs = lookifyServices.allSongs();
        //Ordenando Lista con metodo Collections.sort 
        Collections.sort(songs, new Comparator<Song>() {
            @Override
            public int compare(Song s1, Song s2) {
                return s2.getRating() - s1.getRating();
            }
        });
        model.addAttribute("songs", songs);
        return "topTenSongs";
    }

    // Controladores de Busqueda
    @RequestMapping(value="/search",method = RequestMethod.POST)
    public String search(@RequestParam("artist") String artist) {
        return "redirect:/dashboard/search/"+artist;
    }

    @RequestMapping("/search/{artist}")
    public String searchResult(@PathVariable("artist") String artist, Model model) {
        List<Song> songs = lookifyServices.findSongsByArtist(artist);
        model.addAttribute("artist", artist);
        model.addAttribute("songs", songs);
        System.out.println(artist);
        return "searchSong";
    }
    
}

