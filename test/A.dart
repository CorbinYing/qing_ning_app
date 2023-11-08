void main() {
  int i = 2147483648;

  while (true) {
    if ((i--) % 2 == 1) {
      print('i--为奇数:i=$i');
    } else {
      print('i--为偶数:i=$i');
    }
    if (i <= 0) {
      break;
    }
  }
}
