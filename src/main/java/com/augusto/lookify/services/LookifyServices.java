package com.augusto.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.augusto.lookify.models.Song;
import com.augusto.lookify.repositories.LookifyRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LookifyServices {
    
    private final LookifyRepository lookifyRepository;

    //Devolviendo todas las canciones
    public List <Song> allSongs() {
        return lookifyRepository.findAll();
    }

    //Creando una cancion
    public Song createSong(Song song){
        return lookifyRepository.save(song);
    }

    //Obteniendo la informacion de una cancion
    public Song findSong (Long id) {
        Optional<Song> optionalSong = lookifyRepository.findById(id);
        if(optionalSong.isPresent()) {
            return optionalSong.get();
        } else {
            return null;
        }
    }

    //Borrar una cancion si encuentra el id
    public void deleteSong(Long id) {
        Song song = findSong(id);
        if (song !=null) {
            lookifyRepository.deleteById(id);
        }
    }

    public List<Song> findSongsByArtist(String artist) {
        return lookifyRepository.findByArtistContaining(artist);
    }
}
