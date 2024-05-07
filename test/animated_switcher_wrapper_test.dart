import 'animated_switcher_scale_fade_test.dart'
    as animated_switcher_scale_fade_test;
import 'animated_switcher_size_fade_test.dart'
    as animated_switcher_size_fade_test;
import 'animated_switcher_slide_fade_test.dart'
    as animated_switcher_slide_fade_test;
import 'scale_fade_transition_test.dart' as scale_fade_transition_test;
import 'size_fade_transition_test.dart' as size_fade_transition_test;
import 'slide_fade_transition_test.dart' as slide_fade_transition_test;

void main() {
  scale_fade_transition_test.main();
  size_fade_transition_test.main();
  slide_fade_transition_test.main();
  animated_switcher_size_fade_test.main();
  animated_switcher_slide_fade_test.main();
  animated_switcher_scale_fade_test.main();
}
