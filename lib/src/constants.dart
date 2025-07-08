/// Challenge
const int API_CHALLENGE_SEND = 150;
const int API_CHALLENGE_CANCEL = 151;
/// Verify
const int API_VERIFY_AUTHCODE = 170;
const int API_VERIFY_CHECKSTATUS = 171;
/// Status
const int API_STATUS_CHECK = 171;
///Blocked
const int API_BLOCKED_CHECK = 950;

enum ChallengeStatus{NEW,CANCEL}
enum ChallengeExpiry{ThreeMins,FiveMins,TenMins,FifteenMins,ThirtyMins,SixtyMins}
enum ChallengeType{UserKey,UserKeyAndPattern,UserKeyPatternAndPin,UserKeyAndUserFace,UserKeyAndUserVoice}
