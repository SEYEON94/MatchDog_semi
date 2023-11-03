package com.one.mat.chatting.dao;

import java.util.ArrayList;

import com.one.mat.chatting.dto.ChattingDTO;
import com.one.mat.member.dto.ProfileDTO;

public interface ChattingDAO {
	
	ArrayList<ChattingDTO> chattingListDo(int ppn, int offset, int memberIdx);

	ChattingDTO chatProInfo(int pro_idx);
	
	ChattingDTO chatMsgInfo(int chat_idx);
	
	ChattingDTO chatPhotoInfo(int chat_idx);
	
	ArrayList<ProfileDTO> proIdx(int memberIdx);

	ArrayList<ChattingDTO> chatIdx(int pro_idx);

	ArrayList<ChattingDTO> chatRoomListDo();

	int chatSaveDo();

	ArrayList<ChattingDTO> chatRoomList(int chat_id);

	ChattingDTO chattingRoomGo(int chat_id);

	


}
