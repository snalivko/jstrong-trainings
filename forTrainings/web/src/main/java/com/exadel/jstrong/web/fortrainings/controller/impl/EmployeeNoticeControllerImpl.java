package com.exadel.jstrong.web.fortrainings.controller.impl;

import com.exadel.jstrong.fortrainings.core.dao.EmployeeNoticeDAO;
import com.exadel.jstrong.fortrainings.core.model.Notice;
import com.exadel.jstrong.web.fortrainings.controller.EmployeeNoticeController;
import com.exadel.jstrong.web.fortrainings.model.NoticeCountUI;
import com.exadel.jstrong.web.fortrainings.model.NoticeUI;
import com.exadel.jstrong.web.fortrainings.model.NoticesHistoryUI;
import com.exadel.jstrong.web.fortrainings.model.NoticesUI;
import com.exadel.jstrong.web.fortrainings.model.comparator.ActualNoticeUIComp;
import com.exadel.jstrong.web.fortrainings.model.comparator.NoticeUIComp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by stas on 30.07.15.
 */
@Component
public class EmployeeNoticeControllerImpl implements EmployeeNoticeController {

    @Autowired
    private EmployeeNoticeDAO employeeNoticeDAO;

    @Override
    public NoticeCountUI getNoticeCount(int userId) {
        NoticeCountUI noticeCount = new NoticeCountUI();
        try {
            noticeCount.setBadgeCount(employeeNoticeDAO.getNoticeCount(userId));
            return noticeCount;
        } catch (Throwable e) {
            e.printStackTrace();
            return noticeCount;
        }
    }

    @Override
    public NoticesUI getEmployeeNotices(int userId, int count) {
        NoticesUI result = new NoticesUI();
        try {
            List<Notice> notices = employeeNoticeDAO.getEmployeeActualNotices(userId);
            List<NoticeUI> noticesUI = new ArrayList<>();
            NoticeUI noticeUI;
            for (Notice n : notices) {
                noticeUI = new NoticeUI();
                noticeUI.setId(n.getId());
                noticeUI.setSenderId(n.getSenderId());
                noticeUI.setStatus(n.getStatus());
                noticeUI.setTheme(n.getTheme());
                noticeUI.setText(n.getText());
                noticeUI.setTransactionId(n.getTransactionId());
                noticeUI.setAddDate(n.getAddDate());
                noticesUI.add(noticeUI);
            }
            Collections.sort(noticesUI, new ActualNoticeUIComp());
            result.setActualNotices(noticesUI);
            notices = employeeNoticeDAO.getEmployeeHistoryNoticesByPage(userId, 0, count);
            noticesUI = new ArrayList<>();
            for (Notice n : notices) {
                noticeUI = new NoticeUI();
                noticeUI.setId(n.getId());
                noticeUI.setSenderId(n.getSenderId());
                noticeUI.setStatus(n.getStatus());
                noticeUI.setTheme(n.getTheme());
                noticeUI.setText(n.getText());
                noticeUI.setTransactionId(n.getTransactionId());
                noticeUI.setAddDate(n.getAddDate());
                noticesUI.add(noticeUI);
            }
            Collections.sort(noticesUI, new NoticeUIComp());
            result.setHistoryNotices(noticesUI);
            result.setHistoryCount(employeeNoticeDAO.getHistoryNoticeCount(userId));
        } catch (Throwable e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public NoticesHistoryUI getEmployeeNoticesHistoryByPage(int id, int count, int page) {
        NoticesHistoryUI noticesHistory = new NoticesHistoryUI();
        int limitFrom = (page - 1) * count;
        List<Notice> notices = employeeNoticeDAO.getEmployeeHistoryNoticesByPage(id, limitFrom, count);
        List<NoticeUI> noticesUI = new ArrayList<>();
        NoticeUI noticeUI;
        for (Notice n : notices) {
            noticeUI = new NoticeUI();
            noticeUI.setId(n.getId());
            noticeUI.setSenderId(n.getSenderId());
            noticeUI.setStatus(n.getStatus());
            noticeUI.setTheme(n.getTheme());
            noticeUI.setText(n.getText());
            noticeUI.setTransactionId(n.getTransactionId());
            noticeUI.setAddDate(n.getAddDate());
            noticesUI.add(noticeUI);
        }
        noticesHistory.setHistory(noticesUI);
        return noticesHistory;
    }

    @Override
    public boolean markNoticeAsComplete(int userId, int noticeId) {
        return employeeNoticeDAO.markAsComplete(userId, noticeId);
    }
}
