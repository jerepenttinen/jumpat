import { NavigationProp, useNavigation } from "@react-navigation/native";
import React from "react";
import { FlatList } from "react-native";
import { IconButton, List, Surface } from "react-native-paper";

import Set from "~/data/models/Set";
import FormattedSet from "~/presentation/components/FormattedSet";
import { StackParamList } from "~/presentation/navigation/Navigator";

type Props = {
  sets: Set[];
};

export default function ExerciseList({ sets }: Props) {
  return (
    <Surface elevation={0}>
      <FlatList
        data={sets}
        renderItem={({ item: set }) => <ExerciseListItem set={set} />}
        contentContainerStyle={{ paddingBottom: 100 }}
      />
    </Surface>
  );
}

function ExerciseListItem({ set }: { set: Set }) {
  const navigation = useNavigation<NavigationProp<StackParamList>>();

  return (
    <List.Item
      title={<FormattedSet set={set} />}
      right={(props) => (
        <IconButton
          {...props}
          icon="pencil-outline"
          onPress={() => {
            navigation.navigate("EditExercise", {
              setId: set.id,
            });
          }}
        />
      )}
    />
  );
}
