package com.exadel.jstrong.fortrainings.core.dao.impl;

import com.exadel.jstrong.fortrainings.core.dao.BaseDAO;
import com.exadel.jstrong.fortrainings.core.dao.EmployeeDAO;
import com.exadel.jstrong.fortrainings.core.dao.RoleDAO;
import com.exadel.jstrong.fortrainings.core.model.Employee;
import com.exadel.jstrong.fortrainings.core.model.Meet;
import com.exadel.jstrong.fortrainings.core.model.Role;
import com.exadel.jstrong.fortrainings.core.model.Subscribe;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

@Service
public class EmployeeDAOImpl extends BaseDAO<Employee> implements EmployeeDAO {
    private static Logger logger = Logger.getLogger(EmployeeDAOImpl.class.getName());

    @Autowired
    private RoleDAO roleDAO;

    @Override
    public Employee selectByAuthorization(String login, String password) {
        try {
            password = DigestUtils.md5Hex(password);
            Query query = em.createQuery("SELECT e FROM Employee e WHERE e.login = :log  AND  e.password = :pas", Employee.class).setParameter("log", login).setParameter("pas", password);
            Employee employee = (Employee) query.getSingleResult();

            return employee;
        } catch(Throwable e){
            logger.warn(e.toString());
            return null;
        }
    }

    @Override
    public String getNameById(int id){
        Query query = em.createQuery("SELECT name FROM Employee WHERE id = :id").setParameter("id", id);
        return (String)query.getSingleResult();
    }

    //TODO: replace e.printStackTrace --> logger.warn/error
    @Override
    public boolean isAdmin(int id) {
        try {
            List<String> roles = em.createNativeQuery("SELECT name FROM role, employee_role WHERE role.id = employee_role.role_id and employee_role.employee_id = :userId").setParameter("userId", id).getResultList();
            return roles.contains("admin");
        } catch (Throwable e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Employee> getAllUsers() {
        return super.getAll(Employee.class);
    }

    @Override
    public List<Employee> getAllInsideUsers() {
        try{
            Role role = roleDAO.getRoleByName("external");
            StringBuilder request = new StringBuilder();
            request.append("SELECT * FROM employee WHERE id IN (SELECT employee_id FROM employee_role WHERE role_id <> :roleId)");
            request.append(" UNION ");
            request.append("SELECT * FROM employee WHERE (SELECT COUNT(*) FROM employee_role WHERE employee_id = employee.id) = 0");
            return em.createNativeQuery(request.toString(), Employee.class).setParameter("roleId", role.getId()).getResultList();
        }catch(Throwable e){
            logger.warn(e.toString());
            return new ArrayList<Employee>();
        }
    }

    @Override
    public String getEmail(int id) {
        Employee em = getById(Employee.class, id);
        return em.getMail();
    }

    @Override
    public List<String> getAllMails() {
        return em.createNativeQuery("SELECT mail FROM employee").getResultList();
    }

    @Override
    public List<String> getEmployeesMails(List<Employee> employees) {
        List<String> emails = new ArrayList<>();
        for(Employee employee: employees) {
            emails.add(getEmail(employee.getId()));
        }
        return  emails;
    }

    @Override
    public List<Employee> getAdmins() {
        //Role admin = roleDAO.getRoleByName("admin");
        //return admin.getEmployees();
        String request = "SELECT * FROM for_trainings.employee WHERE id IN (SELECT employee_id FROM for_trainings.employee_role WHERE role_id = 1)";
        Query query = em.createNativeQuery(request, Employee.class);
        return query.getResultList();
    }

    @Override
    public Employee getById(int id) {
        return super.getById(Employee.class, id);
    }

    @Override
    public Employee saveEmployee(Employee employee) {
        employee.setPassword(DigestUtils.md5Hex(employee.getPassword()));
        return super.save(employee);
    }

    @Override
    @Transactional
    public void setEmployeeRole(Employee employee, String name) {
        try {
            int roleId = roleDAO.getRoleId(name);
            em.createNativeQuery("INSERT INTO employee_role (employee_id, role_id) VALUES (:eId, :rId)").setParameter("eId", employee.getId()).setParameter("rId", roleId).executeUpdate();
        } catch(Throwable e){
            logger.warn(e.toString());
        }
    }

    @Override
    public Employee getEmployee(int id) {
        try{
            return getById(Employee.class, id);
        }catch (Throwable e){
            logger.warn(e.toString());
            return null;
        }
    }

    @Override
    public boolean isSubscriber(int id) {
        try {
            CriteriaQuery<Subscribe> query = em.getCriteriaBuilder().createQuery(Subscribe.class);
            Root<Subscribe> root = query.from(Subscribe.class);
            query.where(root.get("employeeId").in(id));
            List<Subscribe> subscribes = em.createQuery(query).getResultList();
            return !subscribes.isEmpty();
        } catch (Throwable e) {
            return false;
        }
    }


    @Override
    public List<Employee> getEmployeesBySubscribe(int trainingId) {
        Query query = em.createQuery("SELECT s.employeeId FROM Subscribe s WHERE s.trainingId = :trainingId and s.status = :status", Integer.class);
        query.setParameter("trainingId", trainingId);
        query.setParameter("status", "Approve");
        List<Integer> ids = (List<Integer>)query.getResultList();
        List<Employee> employees = new ArrayList<>();
        for(Integer id: ids) {
            employees.add(getEmployee(id));
        }
        return employees;
    }

    @Override
    public Integer getEmployeeRoleId(int userId) {
        try {
            List<Integer> rolesId;
            rolesId = (List<Integer>)em.createNativeQuery("SELECT role_id FROM employee_role WHERE employee_id = :uId")
                    .setParameter("uId", userId)
                    .getResultList();
            if (rolesId.contains(2)) {
                return 2;
            }
        } catch(Throwable e){
            e.printStackTrace();
        }
        return null;
    }
}