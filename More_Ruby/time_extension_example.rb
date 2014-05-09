#  Note: Time.now returns current time as seconds since epoch
class Fixnum
  def seconds  ; self ; end
  def minutes  ; self * 60 ; end
  def hours    ; self * 60 * 60 ; end
  def ago      ; Time.now - self ; end
  def from_now ; Time.now + self ; end
end
Time.now    
# => Mon Nov 07 10:18:10 -0800 2011
5.minutes.ago
# => Mon Nov 07 10:13:15 -0800 2011
5.minutes - 4.minutes
# => 60
3.hours.from_now
# => Mon Nov 07 13:18:15 -0800 2011
