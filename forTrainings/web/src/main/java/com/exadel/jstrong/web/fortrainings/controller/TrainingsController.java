package com.exadel.jstrong.web.fortrainings.controller;

import com.exadel.jstrong.fortrainings.core.model.Training;

import java.util.List;

public interface TrainingsController {
    List<Training> getAllTrainings(int userId);
    List<Training> getSearchData(String str);
}
