import React, { useEffect, useRef } from "react";
import useElementOnScreen from "./useElementOnScreen";
import { Video, IconButton, Box } from "gestalt";

const Videos = ({ url }) => {
  const [playing, setPlaying] = React.useState(false);
  const videoRef = useRef(null);

  const options = {
    root: null,
    rootMargin: "0px",
    threshold: 0.3,
  };
  const isVisibile = useElementOnScreen(options, videoRef);

  useEffect(() => {
    if (isVisibile) {
      setPlaying(true);
    } else {
      setPlaying(false);
    }
  }, [isVisibile]);

  return (
    <Video
      accessibilityMaximizeLabel="Maximize"
      accessibilityMinimizeLabel="Minimize"
      accessibilityMuteLabel="Mute"
      accessibilityPauseLabel="Pause"
      accessibilityPlayLabel="Play"
      accessibilityProgressBarLabel="Progress bar"
      accessibilityUnmuteLabel="Unmute"
      accessibilityHideCaptionsLabel="Hide captions"
      accessibilityShowCaptionsLabel="Show captions"
      loop
      playsInline
      aspectRatio={1080 / 1920}
      objectFit="cover"
      onControlsPlay={() => setPlaying(true)}
      onControlsPause={() => setPlaying(false)}
      playing={playing}
      src={url}
      volume={0}
    >
      {!playing ? (
        <Box
          ref={videoRef}
          width="100%"
          height="100%"
          display="flex"
          justifyContent="center"
          alignItems="center"
        >
          <IconButton
            accessibilityLabel="Love"
            bgColor="white"
            icon="play"
            size="lg"
            onClick={() => setPlaying(true)}
            ref={videoRef}
          />
        </Box>
      ) : null}
      {playing ? (
        <Box
          ref={videoRef}
          width="100%"
          height="100%"
          display="flex"
          justifyContent="center"
          alignItems="center"
        >
          <Box display="visuallyHidden">
            <IconButton
              accessibilityLabel="Love"
              bgColor="white"
              icon="pause"
              size="lg"
              onClick={() => setPlaying(false)}
              ref={videoRef}
            />
          </Box>
        </Box>
      ) : null}
    </Video>
  );
};

export default Videos;
