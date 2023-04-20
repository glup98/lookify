package com.augusto.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.augusto.lookify.models.Song;

public interface LookifyRepository extends CrudRepository<Song,Long> {
    List<Song> findAll();
    List<Song> findByArtistContaining(String artist );
}
