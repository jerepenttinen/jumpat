import { MaterialCommunityIcons } from "@expo/vector-icons";
import { Appbar } from "react-native-paper";

export function EditWorkoutHeader() {
  return (
    <Appbar.Action
      icon={({ color, size }) => (
        <MaterialCommunityIcons name="calendar" color={color} size={size} />
      )}
      onPress={() => {
        //TODO
        console.log("TODO");
      }}
    />
  );
}

export default function EditWorkout() {
  return <></>;
}
