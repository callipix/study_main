package kr.or.ddit.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.chat.vo.Room;
import kr.or.ddit.mapper.ChatMapper;
@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	ChatMapper chatMapper;

	@Override
	public int insert(Room room) {
		return this.chatMapper.insert(room);
	}

}
