package com.exadel.jstrong.web.fortrainings.controller.impl;

import com.exadel.jstrong.fortrainings.core.dao.MeetDAO;
import com.exadel.jstrong.fortrainings.core.dao.ParticipantDAO;
import com.exadel.jstrong.fortrainings.core.dao.SubscribeDAO;
import com.exadel.jstrong.fortrainings.core.dao.TrainingDAO;
import com.exadel.jstrong.fortrainings.core.model.Meet;
import com.exadel.jstrong.fortrainings.core.model.Participant;
import com.exadel.jstrong.web.fortrainings.controller.ParticipantController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Anton on 03.08.2015.
 */
@Component
public class ParticipantControllerImpl implements ParticipantController {

    @Autowired
    private MeetDAO meetDAO;
    @Autowired
    private SubscribeDAO subscribeDAO;
    @Autowired
    private ParticipantDAO participantDAO;
    @Autowired
    private TrainingDAO trainingDAO;

    @Override
    public void recordToMeets(int subscribeId, int trainingId) {
        List<Meet> meets = meetDAO.getMeetsByTrainingId(trainingId);
        List<Participant> participants = new ArrayList<>();
        Participant participant = null;
        for (Meet m: meets){
            participant = new Participant();
            participant.setSubscribeId(subscribeId);
            participant.setMeetId(m.getId());
            participant.setAbsent(false);
            participants.add(participant);
        }
        participantDAO.addParticipants(participants);
    }

    @Override
    public void deleteFromMeets(int subscribeId, int trainingId) {
        List<Integer> meetIds = trainingDAO.getMeetIdsByTrainingId(trainingId);
        List<Participant> participants = subscribeDAO.getParticipantsByMeetIds(subscribeId, meetIds);
        participantDAO.deleteParticipants(participants);
    }
}
