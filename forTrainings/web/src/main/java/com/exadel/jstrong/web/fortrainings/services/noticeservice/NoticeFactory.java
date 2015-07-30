package com.exadel.jstrong.web.fortrainings.services.noticeservice;

import com.exadel.jstrong.fortrainings.core.model.Meet;
import com.exadel.jstrong.fortrainings.core.model.Notice;
import com.exadel.jstrong.fortrainings.core.model.Training;

import java.util.Date;

/**
 * Created by Anton on 30.07.2015.
 */
public class NoticeFactory {

    public static Notice getMeetIn3HourNotice(Meet meet, Training training){
        Notice notice = new Notice();
        notice.setTheme("Meet is coming!");
        notice.setText("Meet of training " + training.getName() + "will be in 3 hours!");
        notice.setSenderId(1);
        notice.setStatus("info");
        notice.setTrainingId(training.getId());
        Date date = meet.getDate();
        int hour = date.getHours();
        date.setHours(hour - 3);
        notice.setAddDate(date);
        return notice;
    }

}
