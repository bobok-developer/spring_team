package xyz.sumtplus.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.log4j.Log4j;

/**
 * 비밀번호 암호화
 *
 * @author 류슬희
 * @date   2021. 5. 19.
 */
@Log4j
public class CustomNoOpasswordEncoder implements PasswordEncoder{

	@Override
	public String encode(CharSequence rawPassword) {
		log.warn("before password ... :: " + rawPassword);
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		log.warn("matches ... :: " + rawPassword + " :: " + encodedPassword);
		return rawPassword.toString().equals(encodedPassword);
	}
}
