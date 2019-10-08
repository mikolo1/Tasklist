package utils;

import repositories.UserRepository;

import javax.persistence.NoResultException;

public class UserUtils {
    public static boolean userExists(String email){
        UserRepository userRepository = new UserRepository();
        try {
            if (userRepository.findByLogin(email) != null) {
                return true;
            }
        }catch (NoResultException no){

        }
        return false;
    }
}
