// http://stackoverflow.com/questions/879152/how-do-i-make-javascript-beep
var Oscillator = {}
Oscillator.play = (function () {
	var ctx = new(window.audioContext || window.webkitAudioContext);
	return function (duration, freq, finishedCallback) {
		duration = +duration;
		if (typeof finishedCallback != "function") {
			finishedCallback = function () {};
		}
		var osc = ctx.createOscillator();
		osc.type = 0;
		osc.connect(ctx.destination);
		osc.frequency.value = freq;
		osc.noteOn(0);
		setTimeout(
			function () {
				osc.noteOff(0);
				finishedCallback();
			}
			,duration
		);
	};
})();
