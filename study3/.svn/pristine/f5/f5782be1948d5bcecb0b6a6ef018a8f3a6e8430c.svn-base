package xyz.sumtplus.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Data;
import lombok.extern.log4j.Log4j;
import xyz.sumtplus.domain.MemberVO;
import xyz.sumtplus.mapper.MemberMapper;
import xyz.sumtplus.security.domain.CustomUser;


/**
 * 유저디테일서비스
 *
 * @author 류슬희
 * @date   2021. 5. 19.
 */
@Log4j
@Data
public class CustomUserDetailsService implements UserDetailsService{
	@Autowired
	private MemberMapper memberMapper;


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn(username);
		Long userNo = memberMapper.findUserNoBy(username);
		MemberVO vo =  memberMapper.read(userNo);
		//log.warn(!vo.isEnabled());
		/*if(!vo.isEnabled()) {
			return null;
		}*/
		log.warn("member mapper's vo :: "+ vo);
		//User user = new CustomUser(vo);
		//log.warn("user : " + user);
		//return vo == null ? null : user;
		return vo == null || !vo.isEnabled() ? null : new CustomUser(vo);
	}
}