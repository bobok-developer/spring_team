package xyz.sumtplus.naver;

import com.github.scribejava.core.builder.api.DefaultApi20;

/**
 * 네이버로그인api관련 클래스
 *
 * @author 민지현
 * @date   2021. 5. 30.
 */
public class NaverLoginApi extends DefaultApi20 {
	protected NaverLoginApi() {
	}

	private static class InstanceHolder {
		private static final NaverLoginApi INSTANCE = new NaverLoginApi();
	}

	public static NaverLoginApi instance() {
		return InstanceHolder.INSTANCE;
	}
	
	// 토큰발급
	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}
	
	// 요청 url
	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}
}

